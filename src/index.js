import "./main.css";
import { Elm } from "./Main.elm";
import * as serviceWorker from "./serviceWorker";
import WebViewer from "@pdftron/webviewer";

Elm.Main.init({
  node: document.getElementById("root"),
});

WebViewer(
  {
    path: "/webviewer",
    initialDoc: "document.pdf",
  },
  document.getElementById("viewer")
).then((instance) => {
  const docViewer = instance.docViewer;
  const annotManager = instance.annotManager;
  // call methods from instance, docViewer and annotManager as needed

  // you can also access major namespaces from the instance as follows:
  // const Tools = instance.Tools;
  // const Annotations = instance.Annotations;

  docViewer.on("documentLoaded", () => {
    // call methods relating to the loaded document
  });
});

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
