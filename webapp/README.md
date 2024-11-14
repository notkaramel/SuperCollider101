# Webapp instructions
## Requirement
- `npm`
    - You can also use `pnpm`, or `yarn`
    - If you're fancy, use `deno` (v2) or `bun`

## Goals
We need to:
- [ ] Set up a working directory
- [ ] Install dependencies for OSC
- [ ] Create an OSC message
- [ ] Create a button that sends that OSC message
- [ ] Make sure the `scsynth` server is up
- [ ] Receive the response and do something with it

## Step 1: Set up a working directory
- Go to your desired directory
```sh
cd path/to/my/directory
```

- Start an app named `scapp` using `Vite`
```sh
npm create vite@latest scapp
```

- Configuration that is used in the workshop:
```
? Select a framework: Vanilla
? Select a variant: JavaScript
```

- Change directory to your app, install dependencies, and start the development site
```sh
cd scapp
npm install
npm run dev
```

- You will now see a website premade at `localhost:5173`. Thanks to `Vite`, everytime you make a change on your source code, it will automatically update the webapp. You can always terminate the server with `CTRL C` or `CMD C`

## Step 2: Install dependencies for OSC
## Step 3: Create an OSC message
## Step 4: Create a button that sends that OSC message
## Step 5: Make sure the `scsynth` server is up
## Step 6: Receive the response and do something with it


