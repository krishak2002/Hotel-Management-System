# Hotel Management System

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)

## Introduction

Welcome to Hotel Management System, a platform that simplifies hotel management operations. Whether you're a hotel owner, manager, or guest, this system provides an efficient way to handle reservations, manage rooms, and streamline the overall hotel experience.

## Features

- **User-Friendly Interface:** An intuitive interface for users to explore hotels, check room availability, and make reservations.
- **Hotel Management Dashboard:** Comprehensive dashboard for hotel owners and managers to manage bookings, room status, and staff.
- **Online Reservations:** Guests can easily make reservations online, specifying check-in and check-out dates.
- **Room Availability Checker:** Real-time room availability checker for users to find suitable accommodations.
- **Staff Management:** Tools for managing hotel staff, including roles, schedules, and performance tracking.
- **Billing and Invoicing:** Automated billing and invoicing system for transparent and accurate financial transactions.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following prerequisites:

- Java Development Kit (JDK) installed
- Spring Boot installed
- MySQL installed and running

### Installation

1. Clone the repository:
    ```
    git clone https://github.com/your-username/hotel-management-system.git
    cd hotel-management-system
    ```

2. Set up MySQL database:
    - Create a new MySQL database for the Hotel Management System.
    - Update the database configurations in the `application.properties`` file.

    ```spring.datasource.url=jdbc:mysql://localhost:3306/hotel_management
    spring.datasource.username=your_username
    spring.datasource.password=your_password
    ```

3. Start the application:
    ```./mvnw spring-boot:run```


The application should now be running at http://localhost:8080.


