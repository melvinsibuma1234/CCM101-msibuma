# Multi-Tier Architecture

## What is Two-Tier Architecture?

Two-Tier Architecture is an application structure that separates an application into two main tiers: the Web/Application Tier and the Database Tier. In this laboratory activity, Nextcloud serves as the Web/Application Tier, while MariaDB serves as the Database Tier.

## The Web/Application Tier

The Web/Application Tier is responsible for serving the user interface and handling HTTP requests from users. In this activity, the Nextcloud container provides the web application that users can access through a web browser.

The Nextcloud application receives requests from users and communicates with the database when it needs to store or retrieve application information.

## The Database Tier

The Database Tier is responsible for storing persistent data used by the application. In this activity, MariaDB is used as the database container.

The database stores information required by Nextcloud, including user credentials and file metadata.

## Why Separate Them?

Separating the web application and database into two different containers makes the system easier to manage and maintain. Each container has a specific responsibility, and the application and database can be managed separately instead of putting everything inside one container.

This also represents a multi-tier architecture where the application tier communicates with the database tier to provide the complete cloud storage service.
