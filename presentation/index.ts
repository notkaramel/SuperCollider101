import Reveal from 'reveal.js';
import Markdown from 'reveal.js/plugin/markdown/markdown.esm';
import RevealMath from 'reveal.js/plugin/math/math';

console.log("This is overkill but I like to do things this way anyways so :)");

new Reveal({ plugins: [
    Markdown,
    RevealMath.KaTeX
] }).initialize();

