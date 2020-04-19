import UIKit

class ImageStore {
    
    // creates NSCacheObject
    let cache = NSCache<NSString,UIImage>()
    
    // sets image to the cache key
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    // returns the image from the cache
    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    // removes image from the cache
    func deleteImage(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
    }
    
}

