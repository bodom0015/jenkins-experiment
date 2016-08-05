# Method 5: Run a single-build Jenkins Pod on the user's behalf
[ndslabs-docker](https://github.com/craig-willis/ndslabs-docker) seems like a much more elegant way to allow for single builds in this instance.

In order to use this same paradigm with Jenkins, on each build we would need to diverge from the normal way users wouldi nteract with Jenkins.

One basic workflow might look like:
# Start a Jenkins Pod on the user's behalf
# If no build job targetting this Dockerfile exists, create a new one using the Jenkins API
# Trigger a new build on the image
# Report success or failure
# Shut down the jenkins service
