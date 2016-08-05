# jenkins-experiment
Testing the feasibility of different methods of running Jenkins in Kubernetes.

# Method 1: Externally-Hosted CI
Use some CI server that does not reside on Nebula.

See method-1/README.md

# Method 2: On Nebula, External to Kubernetes
Spin up a raw VM and run a jenkins instance on it.

See method-2/README.md

# Method 3: Central Shared CI Within Kubernetes
Run a single jenkins service/rc within Kubernetes that all users share, but cannot access directly.

See method-3/README.md

# Method 4: Allow user to run and manage their own Jenkins instance

See method-4/README.md

# Method 5: Run a single-build Jenkins Pod on the user's behalf
[ndslabs-docker](https://github.com/craig-willis/ndslabs-docker) seems like a much more elegant way to allow for single builds in this instance.

