#!bin/bash
set -e;

MODEL_NAME=${OLLAMA_MODEL:-llama3.1}

echo "Starting ollama service..."
/bin/ollama serve &

echo "Waiting for ollama to start..."
until curl -s http://localhost:11434/api/tags >/dev/null 2>&1;do
    sleep 2
done

echo "Pulling model $MODEL_NAME..."
if ! curl -s http://localhost:11434/api/tags | grep -q $MODEL_NAME; then
    curl -s -X POST http://localhost:11434/api/pull \
    -H "Content-Type: application/json" \
    -d "{\"name\":\"$MODEL_NAME\"}"
else
    echo "Model $MODEL_NAME already exists."
fi

echo "Ollama is ready and $MODEL_NAME is loaded."
wait