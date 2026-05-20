# Repository Guidelines

## Project Structure & Module Organization

This repository is currently documentation-first. Root-level Markdown files define scope and standards:

- `需求分析报告.md`: requirements for the campus AI Q&A and personalized service system.
- `可行性分析报告.md`: feasibility, risks, and implementation phases.
- `development-standard.md`: architecture, security, API, UI, and testing standards.

When implementation begins, keep code separated by responsibility. Recommended layout:

- `frontend/`: web client, assets, and component tests.
- `backend/`: API service, auth, knowledge-base management, model integration, and tests.
- `docs/`: design notes, API contracts, deployment, and reports.
- `data/`: sample or sanitized knowledge-base imports only. Do not commit private campus data.

## Build, Test, and Development Commands

No build system is present yet. Add commands to each module README when code is introduced:

- `npm install && npm run dev` in `frontend/`: install dependencies and start the client.
- `npm run build` in `frontend/`: produce production assets.
- `pip install -r requirements.txt` in `backend/`: install Python backend dependencies.
- `pytest` in `backend/`: run backend tests.

Prefer checked-in scripts over one-off commands so contributors can reproduce local setup.

## Coding Style & Naming Conventions

Use clear module boundaries: user/auth, knowledge base, chat/Q&A, model gateway, admin, logging, and analytics. Use English names for code paths and identifiers; keep Chinese names for formal reports.

For frontend code, use 2-space indentation, PascalCase components, and kebab-case route paths. For Python backend code, follow PEP 8, 4-space indentation, `snake_case` functions/modules, and `PascalCase` classes. Keep configuration in environment variables or ignored `.env` files.

## Testing Guidelines

Add tests with every feature that changes behavior. Backend tests should cover authentication, permissions, knowledge retrieval, model-call fallbacks, and admin operations. Frontend tests should cover chat flows, role-based views, and form validation.

Use names such as `test_auth.py`, `test_knowledge_base.py`, or `ChatWindow.spec.ts`. Keep fixtures sanitized and small.

## Commit & Pull Request Guidelines

This directory is not currently a Git repository, so no local commit history exists. Use concise, imperative commit messages such as `Add knowledge base import API`.

Pull requests should include a summary, affected modules, test results, linked issue or task, and screenshots for UI changes. For model or knowledge-base changes, describe sources, prompts, and safety checks.

## Security & Configuration Tips

Never commit API keys, model tokens, database passwords, student records, chat logs with personal data, or internal campus documents. Document required environment variables in `.env.example`. Validate input, enforce role-based permissions, and log model failures without exposing sensitive prompts or user content.
