# Storage Types Research

## Comparison of Cloud Storage Types

| Storage Type       | Description                                                                                                        | Primary Use Case                                                               | Cloud Provider Example |
| ------------------ | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ | ---------------------- |
| **Block Storage**  | Stores data in individual blocks that can be attached to a computer or virtual machine.                            | Operating systems, databases, and applications that need direct disk access.   | AWS EBS                |
| **File Storage**   | Stores data as files organized in folders and directories that can be accessed through a shared file system.       | Shared files, documents, and applications that need a traditional file system. | AWS EFS                |
| **Object Storage** | Stores data as objects together with metadata in a storage system designed for large amounts of unstructured data. | Images, videos, backups, and other unstructured data.                          | AWS S3                 |

## Why Object Storage Is Suitable for the Client

Object Storage is a good choice for the client's photo-sharing application because it is designed to store large amounts of unstructured data such as images. It can provide a suitable way to store and access millions of user-uploaded photos separately from the web server.
