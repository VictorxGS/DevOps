# LABORATÓRIO KUBERNTES (KubeNews)
O laboratório tem como objetivo demonstratar resiliência e balanciamento de carga sobre os containers de uma aplicação orquestrada pelo Kubernetes. 
Para prover um Cluster local como infraestrutura foi utilizado o K3D, para orquesração dos containers, o KubeCTL e como aplicação, um web-app chamado KubeNews 
desenvolvido em nodejs com um banco de PosgreSQL. Nesse ambientes foram aplicados os conceitos de 'Selectors', 'Labels', 'Deployments', 'ReplicaSets', 'pods' e loadbaancer.

### Get Start
- Criação do Cluster
  ~~~
  k3d cluster create mycluster -p "8080:30000@loadbalancer"
  ~~~

- Provisionamento do manifesto no diretório ./k8s/
  ~~~
  kubectl create -f deployment.yaml && watch 'kubectl get pods'
  ~~~
  
- REST Client (VsCode extesion)
  
  https://marketplace.visualstudio.com/items?itemName=humao.rest-client
  
- Página de Acesso
  
  http://localhost:8080/

### Requeriments

- K3d install
  
  https://k3d.io/
  
- KubeCTL install
  
  https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

![Screenshot from 2023-10-22 01-12-30](https://github.com/VictorxGS/DevOps/assets/35309833/ca6b85f2-e3ca-4716-95ca-a343a9940b72)


  
