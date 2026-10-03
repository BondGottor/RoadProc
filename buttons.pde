class setline{
  float sliderW = 300, sliderH = 20;
  float sliderPos;
  float sliderX, sliderY;
  float minVal = 0, maxVal = 100;
  float currentVal;
  String value;
  boolean dragging = false;
 setline(float sliderX , float sliderY, String value,float minVal,float maxVal) {
        this.sliderX = sliderX;
        this.value=value;
        this.sliderY = sliderY;
      this.minVal=minVal;
    this.maxVal=maxVal;
  currentVal=(maxVal+minVal)/2;}
    void display(){ 
      fill(200);
  sliderPos = map(currentVal, minVal, maxVal, sliderX, sliderX + sliderW);
  rect(sliderX, sliderY, sliderW, sliderH);
  // 2. Рисуем бегунок
  fill(100);
  rect(sliderPos - 5, sliderY - 5, 10, sliderH + 10); // Бегунок чуть выше и ниже дорожки
  
  // 3. Обновление значения, если мы перетаскиваем бегунок
  if (dragging) {
    // Ограничиваем позицию бегунка пределами дорожки
    sliderPos = constrain(mouseX, sliderX, sliderX + sliderW);
    // Пересчитываем значение на основе новой позиции
    currentVal = map(sliderPos, sliderX, sliderX + sliderW, minVal, maxVal);
  }
  // Отображаем текущее значение
  fill(0);
  text("Значение "+value+": " + nf(currentVal, 1, 2), sliderX, sliderY+50);
}
void mousePressed() {
  // Проверяем, попал ли курсор мыши в область бегунка
  if (mouseX > sliderPos - 5 && mouseX < sliderPos + 5 && 
      mouseY > sliderY - 5 && mouseY < sliderY + sliderH + 5) {
    dragging = true; // Начинаем перетаскивание
  }
}
void mouseReleased() {
  dragging = false; // Заканчиваем перетаскивание
}
}
  class ToggleButton {
  // Свойства
  float x, y;          // позиция
  float w, h;          // ширина и высота
  boolean state;       // состояние кнопки (вкл/выкл)
  String label;        // текст на кнопке
  color bgColor;       // цвет фона
  color hoverColor;    // цвет при наведении
  color pressedColor;  // цвет при нажатии
  color textColor;     // цвет текста
  
  boolean isPressed;   // нажата ли кнопка сейчас
  boolean isHovered;   // находится ли мышь над кнопкой
  
  // Конструктор
  ToggleButton(float x, float y, boolean initialState, String label) {
    this.x = x;
    this.y = y;
    this.w = 200;
    this.h = 50;
    this.state = initialState;
    this.label = label;
    this.bgColor = color(100);
    this.hoverColor = color(150);
    this.pressedColor = color(80);
    this.textColor = color(255);
    
    this.isPressed = false;
    this.isHovered = false;
  }
  
  // Функция mousePressed - вызывается когда нажали на кнопку
  void mousePressed() {
    if (isMouseOver()) {
      isPressed = true;
      // Дополнительные эффекты при нажатии
      println("Кнопка нажата: " + label);
    }
  }
  
  // Функция mouseReleased - вызывается когда отпустили кнопку мыши
  void mouseReleased() {
    if (isPressed && isMouseOver()) {
      // Переключаем состояние только если нажатие и отпускание были на кнопке
      state = !state;
      println("Кнопка отпущена, новое состояние: " + (state ? "ON" : "OFF") + " для " + label);
    }
    isPressed = false;
  }
  
  // Обновление состояния (проверка наведения)
  void update() {
    isHovered = isMouseOver();
  }
  
  // Отрисовка кнопки
  void display() {
    // Выбираем цвет в зависимости от состояния и действий пользователя
    if (isPressed) {
      fill(pressedColor);  // цвет при нажатии
    } else if (state) {
      fill(0, 200, 0);     // зеленый когда включено
    } else if (isHovered) {
      fill(hoverColor);    // светлее при наведении
    } else {
      fill(bgColor);       // обычный цвет
    }
    
    rect(x, y, w, h);
    
    // Рисуем текст
    fill(textColor);
    textAlign(CENTER, CENTER);
    text(label + " " + (state ? "ON" : "OFF"), x + w/2, y + h/2);
  }
  
  // Проверка, находится ли мышь над кнопкой
  boolean isMouseOver() {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
  
  // Получить текущее состояние
  boolean getState() {
    return state;
  }
  
  // Установить состояние принудительно
  void setState(boolean newState) {
    state = newState;
  }
  
  // Изменить позицию
  void setPosition(float newX, float newY) {
    x = newX;
    y = newY;
  }
  
  // Изменить размер
  void setSize(float newW, float newH) {
    w = newW;
    h = newH;
  }
  
  // Изменить текст
  void setLabel(String newLabel) {
    label = newLabel;
  }
}
