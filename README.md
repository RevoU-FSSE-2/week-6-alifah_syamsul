# RevoU-FSSE-2023H2 _ Alifah Syamsul _ W6 Intermediate Assignment _ Dockerizing a Simple Node.js App

This guide will walk you through the process of dockerizing a simple Node.js app on a Windows system, using Docker Desktop and Windows Subsystem for Linux.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Building the Docker Image](#building-the-docker-image)
- [Verifying the App](#verifying-the-app)

## Prerequisites

1. **Install Docker Desktop on Windows:** You need to have Docker installed on your Windows machine. Google "how to install Docker on Windows" to find the latest guide. For a direct link to download Docker Desktop, click [here](https://www.docker.com/products/docker-desktop).

![Installing Docker Desktop on Windows](https://raw.githubusercontent.com/RevoU-FSSE-2/week-6-alifah_syamsul/main/images/1_installing-docker-desktop-on-windows.png)

After downloading, begin the Docker Desktop installation process.

![Beginning the Docker Desktop installation](https://raw.githubusercontent.com/RevoU-FSSE-2/week-6-alifah_syamsul/main/images/2_beginning-the-docker-desktop-installation.png)

Follow the installation process and, once it finishes, you'll need to restart your Windows.

![Installing Docker Desktop](https://raw.githubusercontent.com/RevoU-FSSE-2/week-6-alifah_syamsul/main/images/3_installing-docker-desktop.png)
![Succeeded with the installation](https://raw.githubusercontent.com/RevoU-FSSE-2/week-6-alifah_syamsul/main/images/4_succeeded-with-the-installation.png)

2. **Download the Linux kernel update package:** You need to update the WSL 2 Linux kernel. Download the update package from Microsoft's official site [here](https://aka.ms/wsl2kernel).

![Downloading Linux kernel update package](https://raw.githubusercontent.com/RevoU-FSSE-2/week-6-alifah_syamsul/main/images/5_downloading-linux-kernel-update-package.png)

Install the package and finish the setup wizard.

![Finishing the Windows Subsystem for Linux Update Setup Wizard](https://raw.githubusercontent.com/RevoU-FSSE-2/week-6-alifah_syamsul/main/images/6_finishing-the-windows-subsystem-for-linux-update-setup-wizard.png)

3. **Start Docker Engine in Docker Desktop:** After Docker Desktop is installed, open the application and ensure that the Docker Engine is running.

![Starting Docker Engine](https://raw.githubusercontent.com/RevoU-FSSE-2/week-6-alifah_syamsul/main/images/7_starting-docker-engine.png)

4. **Set WSL 2 as your default version:** Open Windows Powershell and run the command `wsl --set-default-version 2`.

![Running `wsl --set-default-version 2` command](https://raw.githubusercontent.com/RevoU-FSSE-2/week-6-alifah_syamsul/main/images/8_running--wsl-set-default-version-2--command.png)

5. **Sign up for Docker:** If you haven't already, create a Docker account [here](https://hub.docker.com/signup).

![Signing up to Docker](https://raw.githubusercontent.com/RevoU-FSSE-2/week-6-alifah_syamsul/main/images/9_signing-up-to-docker.png)

6. **Verify Docker Installation:** To ensure Docker has been installed correctly, open Windows Powershell and run the command `docker --version`. You should see the Docker version in the output.

![Running `docker --version` command](https://raw.githubusercontent.com/RevoU-FSSE-2/week-6-alifah_syamsul/main/images/10_running--docker-version--command.png)

## Installation

1. **Download the `app.js` file:** Download the `app.js` file which you want to build in Docker.

![Downloading `app.js`](https://raw.githubusercontent.com/RevoU-FSSE-2/week-6-alifah_syamsul/main/images/11_downloading-appjs.png)

2. **Edit the Dockerfile:** Based on the requirements of your Node.js application, modify your Dockerfile accordingly. Below is an example Dockerfile which uses `node:14-slim` as the base image.

```
Dockerfile
# Use an official Node.js runtime as the parent image
FROM node:14-slim

# Set the working directory in the Docker image to '/usr/src/app'.
WORKDIR /app

# Copy package.json and package-lock.json (if available) from your project directory into the Docker image
COPY package*.json ./

# Run 'npm install' in the Docker image to install the app's dependencies.
RUN npm install

# Copy the rest of the app's source code from your project directory into the Docker image.
COPY . .

# Tell Docker that the app listens on port 3001 at runtime.
EXPOSE 3001

# Define the command that Docker runs when the Docker image is run as a container (i.e., 'npm start').
CMD [ "node", "app.js" ]
```

![Editing Dockerfile](https://github.com/RevoU-FSSE-2/week-6-alifah_syamsul/blob/main/images/12_editing-dockerfile.png)

3. **Edit `package.json` file:** Edit package.json file: Modify your package.json file according to your app's requirements. Below is a basic structure:

```
{
    "name": "app",
    "version": "1.0.0",
    "description": "A simple Node.js app",
    "main": "app.js",
    "scripts": {
      "start": "node app.js"
    },
    "dependencies": {
    }
}
```

![Editing package.json](https://raw.githubusercontent.com/RevoU-FSSE-2/week-6-alifah_syamsul/main/images/13_editing-packagejson.png)

## Building the Docker Image

1. **Build the Docker Image:** Open Windows Powershell in the directory containing the Dockerfile and app.js file. Run the following command to build the Docker image:

```
docker build -t app .
```

![Building the Docker Image](https://raw.githubusercontent.com/RevoU-FSSE-2/week-6-alifah_syamsul/main/images/14_building-docker-image.png)

Wait for the building process to finish.

![Finishing the Building Process](https://raw.githubusercontent.com/RevoU-FSSE-2/week-6-alifah_syamsul/main/images/15_finishing-docker-image-building-process.png)

## Verifying the App

1. **Verify the App:** To ensure that the application is running correctly in Docker, use the command specified in app.js.
Replace the <container-id> with the id of your running container, which can be obtained by running docker ps.

For example, if your app.js has a command such as app.listen(port, hostname), then you can use curl http://localhost:<port> to see if your app is running.

Congratulations, you have successfully dockerized a simple Node.js app on Windows!

![Verifying the App](https://raw.githubusercontent.com/RevoU-FSSE-2/week-6-alifah_syamsul/main/images/16_verifying-the-app.png)
![The app.js is running properly](https://raw.githubusercontent.com/RevoU-FSSE-2/week-6-alifah_syamsul/main/images/17_app-is-running-properly.png)
