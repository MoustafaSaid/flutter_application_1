# Team Workflow & Repository Setup Guide

This document outlines the development workflow, branch protection rules, and CI/CD processes for our Flutter project.

## 1. Git Branching Strategy (Gitflow-lite)

We will use a standard branching strategy with a development branch.

-   **`main`**: The **Production** code. Stable. Only merged from `development`. Protected.
-   **`development`**: The **Integration** branch. All features merge here first. Unstable/Testing. Protected.
-   **Feature Branches**: Created from `development` for every new feature or bug fix.
    -   Naming convention: `feature/feature-name` or `fix/bug-description`.

### Workflow Steps for Team Members:

1.  **Get latest code:**
    ```bash
    git checkout development
    git pull origin development
    ```
2.  **Create a new branch:**
    ```bash
    git checkout -b feature/my-new-feature
    ```
3.  **Work and Commit:**
    ```bash
    git add .
    git commit -m "Add login form UI"
    ```
4.  **Push to GitHub:**
    ```bash
    git push origin feature/my-new-feature
    ```
5.  **Create a Pull Request (PR):**
    -   **Base branch**: `development` (NOT `main`).
    -   Request a review.

### Releasing to Production (You Only):
When `development` is stable and ready for release:
1.  Create a PR from `development` to `main`.
2.  Merge it to release.

## 2. Branch Protection Rules (Owner Only Merge)

You need to set up rules for **BOTH** `main` and `development`.

1.  Go to **Settings** -> **Branches** -> **Add branch protection rule**.
2.  **Rule 1**: Pattern `main`
    -   [x] Require pull request.
    -   [x] Require status checks (`analyze`, `test`).
    -   [x] **Restrict who can push**: Select yourself.
3.  **Rule 2**: Pattern `development`
    -   [x] Require pull request.
    -   [x] Require status checks.
    -   [x] **Restrict who can push**: Select yourself (forces PRs from everyone).


## 3. CI/CD Pipelines (Automation)

We have set up GitHub Actions to automatically check code quality.

### Continuous Integration (CI) - `ci.yml`
Runs on every Pull Request to `main`.
-   Checks out code.
-   Installs Flutter.
-   Runs `flutter analyze` (checks for errors/warnings).
-   Runs `flutter test` (runs unit tests).

**If this fails, the PR cannot be merged (if status checks are protected).**

### Continuous Deployment (Build) - `build.yml`
Runs when code is pushed/merged to `main`.
-   Builds the Android APK.
-   Uploads the APK as an artifact to the GitHub Action run.

## 4. Common Commands Cheat Sheet

| Action | Command |
| :--- | :--- |
| Check status | `git status` |
| Stage all changes | `git add .` |
| Commit changes | `git commit -m "Message"` |
| Push branch | `git push origin branch-name` |
| Update main | `git checkout main && git pull` |
| Delete local branch | `git branch -d branch-name` |
