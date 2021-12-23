<template>
  <b-container fluid class="nav-m shadow bg-white rounded">
    <b-navbar toggleable="lg" variant="faded" type="light">
      <a class="navbar-brand" href="/">
        <b-icon icon="battery-full" style="color: #41b883"></b-icon>
        河南省能源综合管控平台
      </a>
      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav class="ml-auto">
          <!-- <b-nav-item class="nav-link" to="/">主页</b-nav-item> -->
          <b-nav-item class="nav-link" to="/charts">实时监测</b-nav-item>
          <!-- <b-nav-item class="nav-link" to="/items">类目</b-nav-item>
          <b-nav-item class="nav-link" to="/my">我的</b-nav-item>
          <b-nav-item class="nav-link" to="/home">后台主页</b-nav-item> -->
          <b-nav-item class="nav-link" to="/nx">用户信息录入</b-nav-item>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </b-container>
</template>

<style scoped>
.nav-m {
  margin-bottom: 3rem;
}
.navbar-brand {
  color: #2f495e;
}
</style>
