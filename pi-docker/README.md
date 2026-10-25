# PI Docker

[PI][100] is an agent harness. This code runs PI in a Docker container.

[100]: https://pi.dev/

## Run PI in Docker

1. Build the container

```
make build-verbose
```

2. Run PI - make sure DEEPSEEK_API_KEY key is set

```
make run wk=.
```

3. Type `/model` to view/set the model

4. Try the following command

```
What does the software project do?
```

5. Type `Ctrl-D` to exit

6. Remove the docker image

```
make rmi
```
