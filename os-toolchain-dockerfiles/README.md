# Dockerfiles for OS development

## Usage
Build a docker image
```
docker build -t os_toolchain .
```

Run a docker container
```
docker run -t -i -v ~/Documents/Workspace/OS_Exercise:/host os_toolchain bash
```