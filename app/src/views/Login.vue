<template>
    <div class="login">
        <b-container>
            <b-row>
                <b-col>
                    <b-row v-if="isLoggedIn">
                        <b-col cols="12">
                            <h6>You're Already Logged In!</h6>
                        </b-col>
                        <b-col cols="12">
                            <logout-button></logout-button>
                        </b-col>
                    </b-row>
                    <b-row v-else>
                        <b-col cols="12">
                            <h6>Please Login by Clicking Below.</h6>
                        </b-col>
                        <b-col cols="12" class="mt-3">
                            <login-button ></login-button>
                        </b-col>
                    </b-row>
                </b-col>
            </b-row>
        </b-container>
    </div>
</template>

<script>
import {BContainer,BRow,BCol} from "bootstrap-vue"
import LoginButton from "@/components/LoginButton";
import LogoutButton from "@/components/LogoutButton";
import {mapGetters} from "vuex";

export default {
    name: 'Login',
    computed: {
      ...mapGetters([
          'isLoggedIn'
      ])
    },
    components: {
        LoginButton,
        LogoutButton,
        BContainer,
        BRow,
        BCol
    }
}
</script>

<style scoped>
h4 {
    text-align:center;
}
</style>
