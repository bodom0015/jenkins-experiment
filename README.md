# jenkins-experiment
Testing the feasibility of different methods of running Jenkins in Kubernetes.

# Build Image
```bash
docker build -t ndslabs/jenkins .
```

# Setup
* Start Jenkins using one of the methods below
* Create a new Freestyle Job
* Set SCM type to "Git" and point at this Git repository
* Add a build step of "Execute shell" for `docker build -t ndslabs/jenkins .`
* Click Apply/Save, then build the new job
* Watch the console output to see your build

# Method 1: Externally-Hosted CI
Use some CI server that does not reside on Nebula.

See method-1/README.md

# Method 2: Central Shared CI (Outside of Kubernetes)
Spin up a raw VM and run a jenkins instance on it.

See method-2/README.md

# Method 3: Central Shared CI (Within Kubernetes)
Run a single jenkins service/rc within Kubernetes that all users share, but cannot access directly.

See method-3/README.md

# Method 4: NDS Labs Service
Allow user to run and manage their own Jenkins instance

See method-4/README.md

# Method 5: Single-Run Job/Pod
Run a single-build Jenkins Pod on the user's behalf

See method-5/README.md
