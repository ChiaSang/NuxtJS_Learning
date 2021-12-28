<template>
  <div>
    <user-info @userAdded="newUser"></user-info>
    <b-container>
      <b-row>
        <b-col cols="6" v-for="(user, index) in userList" :key="index">
          <b-card no-body class="overflow-hidden">
            <b-row no-gutters>
              <!-- <b-col md="6">
            <b-card-img
              src="https://picsum.photos/400/400/?image=20"
              alt="Image"
              class="rounded-0"
            ></b-card-img>
          </b-col> -->
              <b-col>
                <b-card-body title="UserCard">
                  <b-card-text>name:{{ user.name }} </b-card-text>
                  <b-card-text>id:{{ user.id }} </b-card-text>
                  <b-card-text>sex:{{ user.sex }} </b-card-text>
                  <b-card-text>time:{{ user.time }} </b-card-text>
                </b-card-body>
              </b-col>
            </b-row>
          </b-card>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import vueQr from 'vue-qr'
import UserInfo from '../components/UserInfo.vue'
export default {
  components: {
    vueQr,
    UserInfo,
  },
  data() {
    return {
      base_items: ['户号:', '姓名:', '电话:', '表编号:', '外运目的:', '日期:'],
      userList: [],
      imageHeadUrl: '', //必须是require引入，否则不生效，或者报错
    }
  },
  methods: {
    genQRCode() {
      this.imageHeadUrl = require('../assets/images/hbj.jpeg')
      this.Top_up_balance = this.n1 + this.n2
    },
    newUser(user) {
      this.userList.push(user)
      console.log(this.userList)
    },
  },
}
</script>