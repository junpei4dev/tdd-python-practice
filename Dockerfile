# Use the official Python image with a specific version
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Install Poetry
ENV POETRY_VERSION=1.1.13
RUN curl -sSL https://install.python-poetry.org | python3 -

# Configure Poetry to not create a virtual environment inside the container
# as the container itself provides isolation
ENV POETRY_VIRTUALENVS_CREATE=false

# Add Poetry to the PATH
ENV PATH="${PATH}:/root/.local/bin"

# Copy the poetry configuration files
COPY pyproject.toml poetry.lock* ./

# Install project dependencies
RUN poetry install --no-interaction --no-ansi --no-dev

# Copy the rest of the application code
COPY . .

# Switching to a non-root user
RUN useradd --create-home appuser
USER appuser

# Command to run when starting the container
CMD ["poetry", "run", "pytest"]