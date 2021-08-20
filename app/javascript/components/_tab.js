const activeTab = () => {
  if (document.querySelector(".defaultOpen")) {
    document.querySelector(".defaultOpen").click();
  }
};

export { activeTab };
