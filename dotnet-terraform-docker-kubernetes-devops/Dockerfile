# Build image

FROM mcr.microsoft.com/dotnet/sdk:8.0 as BUILD_IMAGE

WORKDIR /source

COPY *.csproj .

RUN dotnet restore

COPY . .

RUN dotnet publish -c Release -o out

# Stage - 2 Run Image as Container

FROM mcr.microsoft.com/dotnet/aspnet:8.0 as RUNTIME_IMAGE

WORKDIR /app

COPY --from=BUILD_IMAGE /source/out .

CMD [ "dotnet", "dotnet_terraform_docker_kubernetes_devops.dll" ] 