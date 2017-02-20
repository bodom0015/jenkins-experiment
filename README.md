# NDS Labs Jenkins CI
NDS Labs Docker-in-Docker image for [Jenkins CI|https://jenkins.io/]

# Building the Image
```bash
docker build -t ndslabs/jenkins .
```

# Running in Docker
```bash
#!/bin/sh
docker run -d -it \
    -u root \
    --privileged \
    -v /var/jenkins_home:/var/jenkins_home \
    -p 8888:8080 \
    -p 50000:50000 \
    --name ${1:-jenkins} \
    ndslabs/jenkins:dind
```

# Running in Kubernetes
Run a single jenkins service/rc within Kubernetes
```bash
apiVersion: v1
kind: Service
metadata:
  name: jenkins
  labels:
    component: jenkins
spec:
  selector:
    component: jenkins
  ports:
    - port: 8080
      protocol: TCP
      nodePort: 30009
      name: http
    - port: 50000
      protocol: TCP
      nodePort: 30010
      name: cli
  type: NodePort
---
apiVersion: v1
kind: ReplicationController
metadata:
  name: jenkins
spec:
  replicas: 1
  selector:
    component: jenkins
  template:
    metadata:
      labels:
        component: jenkins
    spec:
      containers:
      - name: jenkins
        image: ndslabs/jenkins:dind
        ports:
        - containerPort: 8080
          protocol: TCP
        - containerPort: 50000
          protocol: TCP
        securityContext:
          privileged: true
        volumeMounts:
        - mountPath: /var/jenkins_home
          name: jenkins
      volumes:
      - hostPath:
          path: /var/jenkins_home
        name: jenkins
```

# Test Case
* Start Jenkins using one of the methods below
* Create a new Freestyle Job
* Set SCM type to "Git" and point at this Git repository
* Add a build step of "Execute shell" for `docker build -t ndslabs/jenkins .`
* Click Apply/Save, then build the new job
* Watch the console output to see your build
