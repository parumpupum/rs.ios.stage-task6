import Foundation

class CoronaClass {
 
     var seats = [Int]()
     var seatsCount : Int
    
     init(n: Int) {
        seatsCount = n
     }
     
     func seat() -> Int {
        if seats.count == 0 {
            seats.append(0)
            return 0
        }
        
        var maxDistance = -1, seat = -1, position = -1
        for i in 0..<seats.count - 1{
            
            let possibleSeat = (seats[i + 1] + seats[i]) / 2
            if min(possibleSeat - seats[i], seats[i + 1] - possibleSeat) > maxDistance{
                
                maxDistance = min(possibleSeat - seats[i], seats[i + 1] - possibleSeat)
                seat = possibleSeat
                position = i + 1
                
            }
            
        }
        
        if seats[0] - 1 > maxDistance{
            
            maxDistance = seats[0] - 1
            seat = 0
            position = 0
            
        }
        
        if seatsCount - 2 - seats[seats.count - 1] > maxDistance{
            
            maxDistance = seatsCount - 2 - seats[seats.count - 1]
            seat = seatsCount - 1
            position = seats.count
            
        }
        
        seats.insert(seat, at: position)
        return seat
        
     }
     
     func leave(_ p: Int) {
        
        for i in 0..<seats.count{
            
            if seats[i] == p {
                
                seats.remove(at: i)
                return
                
            }
            
        }
        
     }
}
