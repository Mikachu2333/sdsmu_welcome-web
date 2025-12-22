import { mdEnhancePlugin } from "vuepress-plugin-md-enhance";

// https://vitepress.dev/reference/site-config
export default {
  srcDir: "md_files",
  lang: "zh-CN",
  title: "山东第二医科大学指南 SDSMU-Companion",
  description: "321指南",

  plugins: [mdEnhancePlugin({})],

  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    search: {
      provider: "local",
    },

    sidebar: [
      {
        text: "前言",
        collapsed: false,
        base: "/doc_related/",
        items: [
          { text: "特别感谢", link: "special_thanks.md" },
          { text: "版权与声明", link: "copyright_statements.md" },
          { text: "指南简介", link: "" },
        ],
      },
      {
        text: "",
      },
      {
        text: "后记",
        link: "doc_related/epilogue.md",
      },
    ],

    socialLinks: [
      { icon: "github", link: "https://github.com/Mikachu2333/sdsmu_welcome-web" },
    ],
  },
};
