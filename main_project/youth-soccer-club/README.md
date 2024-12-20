## Getting Started

First, install dependencies:

```bash
npm i -g bun
bun i
```

Then, run the development server:

```bash
bun run dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

## Running in Docker

To run the project in Docker, first build the image:

```bash
docker build -t youth-soccer-club .
```

Then, run the container:

```bash
docker run -it --rm -p 3000:3000 youth-soccer-club
```
