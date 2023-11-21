import { Component } from '@angular/core';
import { Pedidos } from 'src/app/interfaces/pedidos';
import { PedidosService } from 'src/app/service/pedidos.service';

@Component({
  selector: 'app-administrador',
  templateUrl: './administrador.component.html',
  styleUrls: ['./administrador.component.css']
})
export class AdministradorComponent {
  listaPedidos: Pedidos[] = []
  constructor(
    private pedidosService: PedidosService
  ){}

  ngOnInit(){
    this.pedidosService.getAllPedidos().subscribe((data) =>{
      this.listaPedidos = data;
    })
  }
}
