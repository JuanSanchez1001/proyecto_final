import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Productos } from '../interfaces/productos';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProductosService {

  BASE_URL = 'http://localhost:3000'
  constructor( private httpClient: HttpClient) { }
  
  getAllProducts(): Observable<Productos[]>{
    const response = this.httpClient.get<Productos[]>(this.BASE_URL+'/productos')
    return response
  }
}
