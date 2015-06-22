# Remarks concerning the pipeline configurations

## local_pipeline setup

 - Two "simple" pipelines with different ways of passing artifacts
 - The *master* exposes a folder ```build/dist``` at the buildStage (to be seen also when opening the tab **Artifacts** on a successfully passed *build_test* job)
 - The *sandboxer* creates (and exposes) a ```.zip``` file as build artifact after successfully passing the *build_test* job
 - Both of the artifacts get fetched in their consecutive *deployStage*


## remote_pipeline setup

 - This setup shows the fan-in feature of go.CD - a main functionality when it comes to deployment pipelines for an architecture with multiple components (in this case integrated services)
 - The services *master*, *one* and *sandboxer* build automatically on changes to their *material* (the git repository) and can separatelybe deployed to an environment (in this case a "dev" environment) through a manual trigger
 - The **contractTest** pipeline gets triggered automatically as soon as an upstream component gets rebuilt (through a commit to a git repository or by being triggered manually). The deployment to the production environment (represented by the **deploy** pipeline) only gets executed on manual interaction. 
 - The pipeline *contractTest* fetches all the necessary artifacts from the preceding pipelines to spin up its own, complete application with integrating services to run some tests on it. The tasks in the *contractTestJob* are no very sleek and the test (represented by calling the healthcheck scripts) are just for representational purpose and should be encapsulated in other scripts or even done by using more elaborate test methods. 
 - Another point worth mentioning is the use of environment variables for reusing the same deployment mechanism (see deploy.sh) on different environments. This way, you can test your deployment mechanism (by deploying to a *dev* environment) before you use it for a deployment to your production environment