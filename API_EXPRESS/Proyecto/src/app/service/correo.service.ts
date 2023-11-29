import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CorreoService {

  BASE_URL= 'http://localhost:3000'

  constructor(
    private httpClient: HttpClient
  ) { }

  sendMessage(body: any){
    const response = this.httpClient.post(this.BASE_URL+'/envio', body);
    return response;
  }
}
