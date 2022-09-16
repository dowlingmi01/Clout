#!/usr/bin/env node
const esbuild = require("esbuild")
const vuePlugin = require("esbuild-plugin-vue3")

esbuild.build({
    entryPoints: ["./app/javascript/application.js"],
    bundle: true,
    outfile: "./app/assets/builds/application.js",
    watch: {
      onRebuild(error, result) {
        if (error) console.error('watch build failed:', error)
        else console.error('watch build succeeded:', result)
      },
    },
    plugins: [vuePlugin()]

}).catch(() => process.exit(1));
Footer
