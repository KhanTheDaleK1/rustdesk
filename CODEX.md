# Codex Documentation: RustDesk

This document provides technical details about the `RustDesk` project for developers.

## Project Structure

The project is a large Rust application with the following structure:

*   `libs/`: Core libraries for video, screen capture, input control, etc.
*   `src/`: The main source code for the application, including UI, server, and client logic.
*   `flutter/`: Flutter code for the desktop and mobile UI.
*   `docs/`: Documentation in various languages.
*   `scripts/`: Build and utility scripts.
*   `.github/`: GitHub Actions workflows for CI/CD.
*   `Cargo.toml`: The Rust package manager configuration file.
*   `GEMINI.md`: Gemini interaction guide.
*   `README.md`: Detailed project documentation.
*   `robots.txt`: Search engine indexing rules.
*   `sitemap.xml`: Sitemap for crawlers.

## Key Files

*   `Cargo.toml`: Defines the project's Rust dependencies and build settings.
*   `src/main.rs`: The entry point of the Rust application.
*   `flutter/lib/main.dart`: The entry point of the Flutter application.
*   `README.md`: Contains detailed information about building, dependencies, and project structure.

## Development Setup

The project is built with Rust and uses Flutter for the UI. The `README.md` provides detailed instructions for setting up the development environment on various platforms, including how to install dependencies and build the project using `cargo` and Docker.

*This document is intended for developers and contributors.*
