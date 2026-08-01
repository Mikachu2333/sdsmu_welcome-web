import { defineClientConfig } from "@vuepress/client";
import { defineAsyncComponent } from "vue";
import FileDownload from "./components/FileDownload.vue";
import FigureImage from "./components/FigureImage.vue";
import InlineImage from "./components/InlineImage.vue";
import Donate from "./components/Donate.vue";
import QrCodeLink from "./components/QrCodeLink.vue";
import QrCodeBlock from "./components/QrCodeBlock.vue";
import "./style.css";

export default defineClientConfig({
  enhance({ app }) {
    app.component("FileDownload", FileDownload);
    app.component("FigureImage", FigureImage);
    app.component("InlineImage", InlineImage);
    app.component("Donate", Donate);
    app.component("QrCodeLink", QrCodeLink);
    app.component("QrCodeBlock", QrCodeBlock);
    app.component(
      "MinxingFloorSearch",
      defineAsyncComponent(() => import("./components/MinxingFloorSearch.vue")),
    );
  },
  setup() {},

  rootComponents: [],
});
