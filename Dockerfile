# Stage 1: Builder
FROM python:3.11-slim AS builder
WORKDIR /app
RUN mkdir -p /app

# Stage 2: Final image
FROM python:3.11-slim
WORKDIR /app

COPY --from=builder /app /app

# Buat user non-root
RUN addgroup --system appgroup && \
    adduser --system --ingroup appgroup appuser

USER appuser