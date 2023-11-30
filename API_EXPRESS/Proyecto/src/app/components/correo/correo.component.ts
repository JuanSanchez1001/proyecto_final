import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';
import { Correo } from 'src/app/interfaces/correo.model';
import { CorreoService } from 'src/app/service/correo.service';

@Component({
  selector: 'app-correo',
  templateUrl: './correo.component.html',
  styleUrls: ['./correo.component.css']
})
export class CorreoComponent {
  @Input() idPedido: string | undefined = '';

  correo = new Correo ("", "", "", "")  

  nombre: string = 'CafeTec';
  asunto: string = 'Pedido listo'
  mensaje: string = 'El pedido con id:' + this.idPedido + 'Esta lisnto'

  constructor(
    public MessageService: CorreoService,
    private route: Router
  ){}

  contactForm(form: any){

    this.MessageService.sendMessage(form).subscribe(() =>{
      alert('Correo enviado')
    })
  }
}
