import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { LoginService } from 'src/app/service/login.service'

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  constructor(
    private loginService: LoginService,
    private router: Router
    ) {
  }

  user = {
    usuario: '',
    password: ''
  }

  ngOnInit(){

  }
  login(){
    console.log(this.user)
    this.loginService.singin(this.user).subscribe( (res:any) => {
      console.log(res);
      localStorage.setItem('token',res.token);

      this.router.navigate(['admin'])

    })
  }
}
