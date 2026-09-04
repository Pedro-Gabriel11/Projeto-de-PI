// Declarção de variáveis
const int PINO_SENSOR_TEMPERATURA = A0;
float temperaturaCelsius;

// Definição do loop de leitura
void setup() {
  Serial.begin(9600);
}

// Definição da simulação de dados 
void loop() {
  int valorLeitura = analogRead(PINO_SENSOR_TEMPERATURA);
  temperaturaCelsius = (valorLeitura * 5.0 / 1023.9) / 0.01;

// Definição da exibição dos dados
  Serial.print("Temperatura: ");
  Serial.print(temperaturaCelsius);
  Serial.println(" C");

 delay(2000); 
}