# Hardware

  - CPU

    - Core architecture

      - x86

        - x86_32 bits (original)

        - x86_64 bits

        - Higher performance

        - Higher power cost

      - ARM

        - 32 bits

        - 64 bits

        - Less power cost

        - Less performance (arguably)

# General programming

  - Machine / Code interface

    - Compiled
      > Depends on language implementation

      - Whole program / Binary intermediate before runtime

        - Java / Python

    - Interpreted
      > Depends on language implementation

      - Instruction by Instruction / Binary in runtime

        - JavaScript

  - Techniques

    - Multi threading (one core / CPU)

    - Multi processing (multi core / CPU)

    - Clusters

    - Microservices

    - Virtualization

      - Virtual Machines (VMs)

      - Containers (docker)

  - Programming  paradagims

    - Declarative

      - Reactive Programming

        - React JS? / React Native?

        - Spring Reactive Stack

      - SQL

      - Functional Programming
        > Fuzzy / Multi paradigm

        - Fixed things / new operations

        - Haskell / Clojure / Scala / Elixir/ JavaScript? / Python?

    - Imperative

      - Object Oriented Programming
        > Fuzzy / Multi paradigm

        - SOLID Principles

        - Hexagonal Architecture

        - New things / fixed operations

        - Java / C# / C++ / Ruby / Python?

      - Procedural

        - C / Pascal / COBOL / Python?

# Tools

  - Data

    - Pandas

      - Dask

      - Pandas profiling

    - Plain SQL

    - Engineering

      - Processing

        - Pyspark

          - Dataproc (GCP) [ETL]

          - EMR (AWS) [ETL]

          - Glue (AWS) [ETL]

        - DBT [T]

        - Airbyte [ELT]

        - Kafka [EL]

        - Change data capture

          - Debezium [EL]

          - Oracle Golden Gate [EL]

      - Storage

        - Open files formats ACID on Object Stores

          - Iceberg

          - Delta Lake

        - Warehouses / Lakes

          - S3

          - Redshift

          - GCS

          - Bigquery

        - Parquet file format

      - Data pipelines orchestration

        - Airflow

          - Astronomer.io (paid)

        - Step functions (AWS)

      - Fully fledged lakehouses

        - Snowflake

        - Databricks

    - Science

      - Scikit-learn

      - SHAP

      - Orange

      - Multi tool platforms

        - Vertex AI (GCP)

        - Sagemaker (AWS)

  - Web

    - Spring

    - Django

    - Rails

  - CI/CD

    - Automation server

      - Jenkins

      - CircleCI

      - GO CD

    - Source control management (SCM)

      - Git (default)

      - Mercurial (Mozilla Firefox uses it)

      - SVN (legacy?)

  - Shells

    - Bash (Linux default)

    - Zsh (Mac default)

      - Oh my zsh (plugins)

      - Powerlevel10k (theme)

    - Fish

  - Code writing

    - Text editors
      > Fuzzy

      - VIM

        - gruvbox (theme)

      - Visual Studio Code

      - Emacs

      - Sublime

      - Notepad++

    - IDEs
      > Fuzzy

      - Jetbrains (PyCharm, Intellij etc)

      - Eclipse

      - Visual Studio

      - Jupyter Notebooks?

# Operating systems

  - OSes

    - Windows

    - UNIX

      - BSD

        - FreeBSD

      - Linux

        - Debian

          - Ubuntu
            > Kubuntu
            > Xubuntu
            > etc

            - Mint

            - Pop!_OS

            - MX Linux

            - Zorin

        - Arch

          - Manjaro

          - Endevouros

        - Red Hat Enterprise Linux (RHEL)

          - Fedora

          - CentOS

        - Alpine

        - OpenSUSE

        - Slackware

        - Gentoo

        - NixOS

        - Puppy

        - ...

        - Desktop Environments (DEs)
          > DEs must implements using Display Servers

          - Gnome

          - KDE

          - XFCE

          - LXQt

          - Cosmic (Pop!_OS)

        - Display Servers
          > DEs must implements using Display Servers

          - Xorg / X11 (old)

          - Wayland (new)

      - MacOS

  - Boot sequence

    - Firmware

      - BIOS

      - Paritition table

        - MBR

        - File system

          - fat / fat32 / NTFS

          - ext1,2,3,4 / btrfs

          - 

          - ZFS

          - exFAT

        - OS boot - /boot / Windows boot partition / etc

        - GPT

      - UEFI

