#!/bin/bash

# Viewer (viewer-user)
openssl genrsa -out viewer-user.key 2048
openssl req -new -key viewer-user.key -out viewer-user.csr -subj "/CN=viewer-user/O=view-group"
openssl x509 -req -in viewer-user.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out viewer-user.crt -days 500

# Admin (admin-user)
openssl genrsa -out admin-user.key 2048
openssl req -new -key admin-user.key -out admin-user.csr -subj "/CN=admin-user/O=admin-group"
openssl x509 -req -in admin-user.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out admin-user.crt -days 500

# Security (security-user)
openssl genrsa -out security-user.key 2048
openssl req -new -key security-user.key -out security-user.csr -subj "/CN=security-user/O=security-group"
openssl x509 -req -in security-user.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out security-user.crt -days 500

# Добавление в kubeconfig
kubectl config set-credentials viewer-user --client-certificate=viewer-user.crt --client-key=viewer-user.key
kubectl config set-credentials admin-user --client-certificate=admin-user.crt --client-key=admin-user.key
kubectl config set-credentials security-user --client-certificate=security-user.crt --client-key=security-user.key

# Контексты
kubectl config set-context viewer-context --cluster=minikube --namespace=default --user=viewer-user
kubectl config set-context admin-context --cluster=minikube --namespace=default --user=admin-user
kubectl config set-context security-context --cluster=minikube --namespace=secure --user=security-user
