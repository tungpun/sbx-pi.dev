# Pi Agent Kit for Docker Sandboxes

Run the [Pi coding agent](https://pi.dev) as a first-class agent in [Docker AI Sandboxes](https://docs.docker.com/ai/sandboxes/customize/kits/).

## Setup

### 1. Auth

Pi supports multiple providers. Register whichever you use:

### Put the config under `files/home/.pi/agent/`

for example: `files/home/.pi/agent/models.json`, `files/home/.pi/agent/settings.json`, it will be mount to `~/.pi/agent/` in the sandbox.

#### Anthropic:
```bash
sbx secret set-custom -g \
    --host api.anthropic.com \
    --env ANTHROPIC_API_KEY \
    --placeholder "sk-ant-placeholder-{rand}" \
    --value "$ANTHROPIC_API_KEY"
```

#### OpenAI:
```bash
sbx secret set-custom -g \
    --host api.openai.com \
    --env OPENAI_API_KEY \
    --placeholder "sk-placeholder-{rand}" \
    --value "$OPENAI_API_KEY"
```

### 2. Validate the kit

```bash
sbx kit validate ./
```

### 3. Run

```bash
sbx run --kit ./ pi .
```

or:

```bash
sbx run --kit ./ pi ~/my-project
```

## Other specs

Add more domains to `spec.yaml` under `allowedDomains` if your workflow needs them (e.g., `api.deepseek.com`, `generativelanguage.googleapis.com`).
