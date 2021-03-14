import { mount } from '@vue/test-utils'
import LoginButton from '@/components/LoginButton.vue'
import {default as tempStore} from "@/store";

describe('LoginButton.vue', () => {

    let store;

    beforeEach(() => {
        store = tempStore;
    })

    it('When component is not requesting login, do not show the circle arrow spinner', () => {
        const wrapper = mount(LoginButton);
        expect(wrapper.find('.spinner-arrow').exists()).toBe(false);
    })
    it('When component is requesting login, show the circle arrow spinner', async() => {
        const wrapper = mount(LoginButton);
        await wrapper.setData({requestingLogin: true});
        expect(wrapper.find('.spinner-arrow').isVisible()).toBe(true);
    })
    it('After user clicks login button, show the circle arrow spinner', async() => {
        const wrapper = mount(LoginButton, { store });
        await wrapper.find('button').trigger('click');
        expect(wrapper.find('.spinner-arrow').isVisible()).toBe(true);
    })
    it('After user clicks login button and login request completes, hide the circle arrow spinner', async() => {
        const wrapper = mount(LoginButton, { store });
        await wrapper.find('button').trigger('click');
        setTimeout(()=>{
            expect(wrapper.find('.spinner-arrow').exists()).toBe(false);
        },1000);
    })
    it('Hard-coded Test Stub', async() => {
        expect(true).toBe(true);
    })
})
