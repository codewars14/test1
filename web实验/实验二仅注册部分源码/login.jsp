<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>注册页面</title>
    <style><!--css样式-->
        .box {
    position: absolute;
    border: solid;
    border-radius: 3%;
    width: 600px;
    height: 400px;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -70%);}
		.in {
    width: 400px;
    height: 30px;}
		.title_1 {
    font-size: 40px;
    text-align: center;}
		.title_2 {
    width: 100px;
    text-align: center;
    font-size: 20px;
    display: inline-block;}
		.button_1 {
    text-align: center;}
		.button_2 {
    width: 75px;
    height: 35px;
    border-radius: 10%;}
    </style>
</head>
<body>
<div id="app">
    <!-- Header 组件 -->
    <header-component></header-component>
    <!-- RegisterForm 组件 -->
    <register-form></register-form>
    <!-- RegisterButton 组件 -->
    <register-button></register-button>
</div>
<!-- Vue.js -->
<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
<script>
    Vue.component('header-component', {
        template: 
            <div class="box">
                <h2 class="title_1">注册页面</h2>
            </div>
    });
    Vue.component('register-form', {
        template: `
            <div class ="box">
                <form>
                    <div>
         <span class="title_2"><span style="color: red;">*</span>用户名</span>
         <input type="text" v-model="username" class="in" id="username"/>
                    </div> <br/>
                    <div>
       <span class="title_2"><span style="color: red;">*</span>输入密码</span>
       <input type="password" v-model="password_1" class="in" id="password_1"/>
                    </div><br/>
                    <div>
       <span class="title_2"><span style="color: red;">*</span>确认密码</span>
       <input type="password" v-model="password_2" class="in" id="password_2"/>
                    </div><br/>
                </form>
            </div>
        `,
        data() {
            return {  
username: '',
password_1: '', 
password_2: '' };
        }
    });
Vue.component('register-button', {
    template:` 
        <div class="box">
           <div class="button_1">
        <input type="submit" value="注册" class="button_2" @click="register">
           </div>
        </div>
`,
    methods: {
       register() {
         if (this.check() == true) {                                    
fetch('http://localhost:8081/ssm_Web_exploded/userregister', {
               method: 'POST',
               headers: {
                   'Content-Type': 'application/x-www-form-urlencoded'
                       },
               body: 'username=' + encodeURIComponent(this.username) + '&password='+encodeURIComponent(this.password_1)
              })
             .then(response => {
                 console.log('Response:', response);
                 console.log(this.username + "  " + this.password_1);
                     if (response.ok) {
                        return response.text();
                     } else {
                           throw new Error('请求失败');
                          }
                     })
               .then(data => {
                      alert('请求成功: ' + data);
                         })
               .catch(error => {
                      alert('错误: ' + error.message);
                        });
                }
    },
         check() {
            let username = document.getElementById('username').value;
            let password_1 = document.getElementById('password_1').value;
            let password_2 =document.getElementById('password_2').value;
            if (username.length === 0 || username.length >= 7) {
        	    this.$set(username.style, 'border', '1px solid red'); 
               this.$set(username.nextSibling.style, 'color', 'red');                     
               this.$set(username.nextSibling, 'textContent', '用户名长度应为1到6个字符');                     				
               return false;                
} else {
                this.$set(username.style, 'border', '');
                this.$set(username.nextSibling.style, 'color', ''); 
                this.$set(username.nextSibling, 'textContent', ''); 
                }

                
                if (password_1.length === 0 || password_1.length >= 7) {
                    this.$set(password_1.style, 'border', '1px solid red'); 
                    this.$set(password_1.nextSibling.style, 'color', 'red');
                    this.$set(password_1.nextSibling, 'textContent', '密码长度应为1到6个字符');                     						
                    return false;
    } else {
                    this.$set(password_1.style, 'border', '');                     
                    this.$set(password_1.nextSibling.style, 'color', '');                     
                    this.$set(password_1.nextSibling, 'textContent', '');                 
                }

                
                if (password_2.length === 0 || password_2.length >= 7 || password_1 !== password_2) {
                    this.$set(password_2.style, 'border', '1px solid red');
                    this.$set(password_2.nextSibling.style, 'color', 'red');                     						
                    if (password_2.length === 0) {
                        		this.$set(password_2.nextSibling, 'textContent', '确认密码不能为空');                     
} else if (password_2.length >= 7) {
                        this.$set(password_2.nextSibling, 'textContent', '密码长度应为1到6个字符');                     
} else {
                        this.$set(password_2.nextSibling, 'textContent', '两次输入密码不一致'); 
                    }
                    return false;                
} else {
                    this.$set(password_2.style, 'border', '');                     					
                    this.$set(password_2.nextSibling.style, 'color', ''); 
                    this.$set(password_2.nextSibling, 'textContent', '');                 
}

                return true;             
}
        }
    });

    new Vue({
        el: '#app'
    });
</script>
</body>
</html>
