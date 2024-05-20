import { windows } from "./windows/index";

const distDir = '/tmp/ags';

const styleDir = `${App.configDir}/src/styles`
const styleEntry = `${styleDir}/index.scss`;
const styleTarget = `${distDir}/style.css`;

const compileStyle = () => {
  print('Compiling css...');

  Utils.exec(`sassc ${styleEntry} ${styleTarget}`);
  App.resetCss();
  App.applyCss(styleEntry);

  print('Compiled');

  return styleEntry;
}

Utils.monitorFile(styleDir, () => compileStyle());

App.config({
  windows,
  style: compileStyle()
});
