/* ============================================
 * VSCode 自定义脚本
 * 光标拖影由 vscode-animations 扩展处理
 * 此文件仅包含补充增强功能
 * ============================================ */

(function () {
  'use strict';

  // --------------------------------------------
  // 平滑滚动增强
  // --------------------------------------------
  class SmoothScroll {
    constructor() {
      this.init();
    }

    init() {
      document.addEventListener('wheel', (e) => {
        const target = e.target.closest('.monaco-scrollable-element');
        if (target) {
          target.style.scrollBehavior = 'smooth';
        }
      }, { passive: true });
    }
  }

  // --------------------------------------------
  // 初始化
  // --------------------------------------------
  function initialize() {
    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', onReady);
    } else {
      onReady();
    }
  }

  function onReady() {
    setTimeout(() => {
      new SmoothScroll();
      console.log('[Custom VSCode] Custom scripts loaded');
    }, 1000);
  }

  initialize();
})();
