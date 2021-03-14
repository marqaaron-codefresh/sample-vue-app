import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isLoggedIn: false
  },
  getters: {
    isLoggedIn(state){
      return state.isLoggedIn;
    }
  },
  actions: {
    setIsLoggedIn(context,payload){
      return new Promise((resolve)=>{
        setTimeout(()=>{
          context.commit('setIsLoggedIn',payload);
          resolve(true);
        },1000)
      })
    }
  },
  mutations: {
    setIsLoggedIn(state,payload){
      state.isLoggedIn = payload;
    }
  },
  modules: {

  }
})
