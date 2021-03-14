<template>
    <b-button variant="primary" size="sm" @click="onLogin()" :disabled="requestingLogin">
        <span class="spinner-arrow" v-if="requestingLogin">
            <b-icon icon="arrow-clockwise" animation="spin" font-scale="1"></b-icon>
        </span>
        Login
    </b-button>
</template>

<script>
import { BButton,BIcon } from 'bootstrap-vue';

export default {
    name: "LoginButton",
    data(){
        return {
            requestingLogin: false
        }
    },
    methods: {
        onLogin(){
            this.requestingLogin = true;
            this.$store.dispatch('setIsLoggedIn',true).then(
                ()=>{
                    this.requestingLogin = false;
                    this.$router.push('/profile');
                }
            );
        }
    },
    components: {
        BButton,
        BIcon
    }
}
</script>

<style scoped>

</style>