docker tag kursovik_ui dmzotovpull/ui:latest
docker tag kursovik_crawler dmzotovpull/crawler:latest
docker tag kursovik_prometheus dmzotovpull/prometheus:latest
docker tag kursovik_grafana dmzotovpull/grafana:latest
docker push dmzotovpull/ui:latest
docker push dmzotovpull/crawler:latest
docker push dmzotovpull/prometheus:latest
docker push dmzotovpull/grafana:latest
kubectl create namespace dev --kubeconfig=/opt/kubeconfig
kubectl delete -f ./kubernetes/mongo-deployment.yml -n dev --kubeconfig=/opt/kubeconfig
kubectl delete -f ./kubernetes/mongo-service.yml -n dev --kubeconfig=/opt/kubeconfig
kubectl delete -f ./kubernetes/rabbitmq-deployment.yml -n dev --kubeconfig=/opt/kubeconfig
kubectl delete -f ./kubernetes/rabbitmq-service.yml -n dev --kubeconfig=/opt/kubeconfig
IMAGE_TAG=latest envsubst < ./kubernetes/crawler-deployment.yml | kubectl delete -f - -n dev --kubeconfig=/opt/kubeconfig
kubectl delete -f ./kubernetes/crawler-service.yml -n dev --kubeconfig=/opt/kubeconfig
IMAGE_TAG=latest envsubst < ./kubernetes/ui-deployment.yml | kubectl delete -f - -n dev --kubeconfig=/opt/kubeconfig
kubectl delete -f ./kubernetes/ui-service.yml -n dev --kubeconfig=/opt/kubeconfig
kubectl delete -f ./kubernetes/ingress-dev.yml -n dev --kubeconfig=/opt/kubeconfig
kubectl delete -f ./kubernetes/ingress-prometheus-dev.yml -n dev --kubeconfig=/opt/kubeconfig
IMAGE_TAG=latest envsubst < ./kubernetes/prometheus-deployment.yml | kubectl delete -f - -n dev --kubeconfig=/opt/kubeconfig
kubectl delete -f ./kubernetes/prometheus-service.yml -n dev --kubeconfig=/opt/kubeconfig
IMAGE_TAG=latest envsubst < ./kubernetes/grafana-deployment.yml | kubectl delete -f - -n dev --kubeconfig=/opt/kubeconfig
kubectl delete -f ./kubernetes/grafana-service.yml -n dev --kubeconfig=/opt/kubeconfig
kubectl apply -f ./kubernetes/mongo-deployment.yml -n dev --kubeconfig=/opt/kubeconfig
kubectl apply -f ./kubernetes/mongo-service.yml -n dev --kubeconfig=/opt/kubeconfig
kubectl apply -f ./kubernetes/rabbitmq-deployment.yml -n dev --kubeconfig=/opt/kubeconfig
kubectl apply -f ./kubernetes/rabbitmq-service.yml -n dev --kubeconfig=/opt/kubeconfig
IMAGE_TAG=latest envsubst < ./kubernetes/crawler-deployment.yml | kubectl apply -f - -n dev --kubeconfig=/opt/kubeconfig
kubectl apply -f ./kubernetes/crawler-service.yml -n dev --kubeconfig=/opt/kubeconfig
IMAGE_TAG=latest envsubst < ./kubernetes/ui-deployment.yml | kubectl apply -f - -n dev --kubeconfig=/opt/kubeconfig
kubectl apply -f ./kubernetes/ui-service.yml -n dev --kubeconfig=/opt/kubeconfig
kubectl apply -f ./kubernetes/ingress-dev.yml -n dev --kubeconfig=/opt/kubeconfig
kubectl apply -f ./kubernetes/ingress-prometheus-dev.yml -n dev --kubeconfig=/opt/kubeconfig
IMAGE_TAG=latest envsubst < ./kubernetes/prometheus-deployment.yml | kubectl apply -f - -n dev --kubeconfig=/opt/kubeconfig
kubectl apply -f ./kubernetes/prometheus-service.yml -n dev --kubeconfig=/opt/kubeconfig
IMAGE_TAG=latest envsubst < ./kubernetes/grafana-deployment.yml | kubectl apply -f - -n dev --kubeconfig=/opt/kubeconfig
kubectl apply -f ./kubernetes/grafana-service.yml -n dev --kubeconfig=/opt/kubeconfig