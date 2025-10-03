import {cwd} from 'node:process';
import {join} from 'node:path';
import {defineConfig} from 'vite';
import {readdir} from 'node:fs/promises';
import type {InputOptions} from 'rollup';

export default defineConfig(async () => {
  const hmtlPagesDir = join(cwd(), 'html-pages')
  const entries = await readdir(hmtlPagesDir);
  const pages: string[] = [];
  for (const entry of entries) {
    if (entry.endsWith('.html') || entry.endsWith('.htm')) {
      pages.push(join(hmtlPagesDir, entry));
    }
  }

  return {
    plugins: [
      {
        name: 'slidev-iframes',
        options(options: InputOptions) {
          // adding the example iframe sources to input makes the build work
          if (!options.input) {
            options.input = [...pages];
          } else if (typeof options.input === 'string') {
            options.input = [options.input, ...pages];
          } else if (Array.isArray(options.input)) {
            options.input = [...options.input, ...pages];
          } else {
            console.error('unexpected options.input: ', options.input);
          }
          return options;
        },
      }
    ]
  };
});
