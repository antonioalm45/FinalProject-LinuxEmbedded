#!/usr/bin/env python3
import time, sys
def read_sensors():
    # TODO: implementar lectura real (p.ej. BME280 via smbus)
    return {"temp_c": 25.0, "humidity": 40.0, "voc": 0.02}
def main():
    print("SEMS daemon iniciado")
    while True:
        data = read_sensors()
        print(f"[SEMS] {data}")
        time.sleep(5)
if __name__ == "__main__":
    sys.exit(main())
