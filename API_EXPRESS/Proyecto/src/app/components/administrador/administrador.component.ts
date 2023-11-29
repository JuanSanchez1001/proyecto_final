import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Pedidos } from 'src/app/interfaces/pedidos';
import { PedidosService } from 'src/app/service/pedidos.service';

@Component({
  selector: 'app-administrador',
  templateUrl: './administrador.component.html',
  styleUrls: ['./administrador.component.css']
})
export class AdministradorComponent {
  
  viewEmail: boolean = false;
  
  listaPedidos: Pedidos[] = [];

  constructor(
    private pedidosService: PedidosService,
    private router: Router
  ){}

  ngOnInit(){
    this.pedidosService.getAllPedidos().subscribe((data) =>{
      this.listaPedidos = data;
    })
  }

  idPedidoSeleccionado: string | undefined = '';

  clickShowEmail(idPedido: string | undefined){
    this.idPedidoSeleccionado = idPedido;
    this.viewEmail = !this.viewEmail
  }
  closeSession(){
    this.router.navigate(['login'])
  }
}
