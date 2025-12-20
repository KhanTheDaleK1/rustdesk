# Contributing to RustDesk

We welcome and appreciate all contributions to RustDesk! Whether it's reporting a bug, suggesting an enhancement, improving documentation, or contributing code, your help is invaluable.

Please take a moment to review this document to make the contribution process as smooth and effective as possible.

## How Can I Contribute?

### Reporting Bugs

*   **Check existing issues:** Before opening a new issue, please search our [issues page](https://github.com/rustdesk/rustdesk/issues) to see if the bug has already been reported.
*   **Provide detailed information:** When reporting a bug, please include:
    *   A clear and concise description of the bug.
    *   Steps to reproduce the behavior.
    *   Expected behavior.
    *   Actual behavior.
    *   Screenshots or video (if applicable).
    *   Your operating system and RustDesk version.
    *   Any relevant error messages from logs (e.g., console output).

### Suggesting Enhancements

*   **Check existing issues:** Search our [issues page](https://github.com/rustdesk/rustdesk/issues) for similar suggestions.
*   **Describe your idea:** Clearly and concisely describe the enhancement. Explain why it would be useful, what problem it solves, and how you envision it working.

### Code Contributions

1.  **Fork the repository:** Start by forking the [RustDesk repository](https://github.com/rustdesk/rustdesk).
2.  **Clone your fork:**
    ```bash
    git clone https://github.com/your-username/rustdesk.git
    cd rustdesk
    ```
3.  **Create a new branch:** Choose a descriptive name for your branch (e.g., `feature/add-dark-mode`, `bugfix/fix-connection-issue`).
    ```bash
    git checkout -b feature/your-feature-name
    ```
4.  **Set up your development environment:**
    *   **Rust:** Ensure you have Rust and Cargo installed. Refer to the official [RustDesk build documentation](https://rustdesk.com/docs/en/dev/build/) for specific setup instructions for your OS.
    *   **C/C++ Dependencies (vcpkg):** RustDesk uses `vcpkg` for managing some C/C++ dependencies. Ensure `vcpkg` is correctly installed and integrated.
    *   **Flutter (for mobile/web UI):** If you're contributing to the Flutter UI, ensure you have Flutter installed and configured.
5.  **Make your changes:**
    *   Follow the existing code style and conventions.
    *   Write clear, maintainable, and well-commented code.
    *   **Write tests:** If you add new features, please add unit and/or integration tests. If you fix a bug, consider adding a regression test.
6.  **Run tests and linting:** Before committing, ensure all existing tests pass and your code adheres to linting rules.
    ```bash
    cargo test --workspace
    cargo clippy --workspace -- -D warnings
    # For Flutter, navigate to flutter/ and run 'flutter test'
    ```
7.  **Commit your changes:** Write clear and concise commit messages. A good commit message explains *what* changed and *why*.
    ```bash
    git commit -m "feat: Add new feature X"
    git commit -m "fix: Resolve bug Y in component Z"
    ```
8.  **Push your branch:**
    ```bash
    git push origin feature/your-feature-name
    ```
9.  **Open a Pull Request (PR):**
    *   Go to the [RustDesk repository on GitHub](https://github.com/rustdesk/rustdesk) and open a new PR from your branch.
    *   Provide a clear title and description for your PR. Explain the changes, the problem it solves, and any relevant context.
    *   Link to any related issues.

### Improving Documentation

*   Documentation improvements are always welcome! This includes `README.md`, `docs/` content, and inline code comments.
*   You can open an issue or directly submit a PR for documentation changes.

## Code of Conduct

Please note that this project is released with a Contributor Code of Conduct. By participating in this project, you agree to abide by its terms.

Thank you for contributing to RustDesk!
