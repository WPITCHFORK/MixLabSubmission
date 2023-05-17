//
//  LessonProgress.swift
//  MixLab
//
//  Created by Will Pitchfork on 09/05/2023.
//

import Foundation
import Combine

final class LessonProgress: ObservableObject {
    @Published var L1: Int = 0 {
        didSet {
            if L1 < 0 {
                L1 = 0
            } else if L1 > 10 {
                L1 = 10
            }
        }
    }
    
    @Published var L2: Int = 0 {
        didSet {
            if L2 < 0 {
                L2 = 0
            } else if L2 > 10 {
                L2 = 10
            }
        }
    }
    
    @Published var L3: Int = 0 {
        didSet {
            if L3 < 0 {
                L3 = 0
            } else if L3 > 10 {
                L3 = 10
            }
        }
    }
    
    @Published var L4: Int = 0 {
        didSet {
            if L4 < 0 {
                L4 = 0
            } else if L4 > 10 {
                L4 = 10
            }
        }
    }
    
    @Published var L5: Int = 0 {
        didSet {
            if L5 < 0 {
                L5 = 0
            } else if L5 > 10 {
                L5 = 10
            }
        }
    }
    
    @Published var L6: Int = 0 {
        didSet {
            if L6 < 0 {
                L6 = 0
            } else if L6 > 10 {
                L6 = 10
            }
        }
    }
    
    @Published var L7: Int = 0 {
        didSet {
            if L7 < 0 {
                L7 = 0
            } else if L7 > 10 {
                L7 = 10
            }
        }
    }

    @Published var L8: Int = 0 {
        didSet {
            if L8 < 0 {
                L8 = 0
            } else if L8 > 10 {
                L8 = 10
            }
        }
    }
    
    @Published var L9: Int = 0 {
        didSet {
            if L9 < 0 {
                L9 = 0
            } else if L9 > 10 {
                L9 = 10
            }
        }
    }
    
    @Published var L10: Int = 0 {
        didSet {
            if L10 < 0 {
                L10 = 0
            } else if L10 > 10 {
                L10 = 10
            }
        }
    }
    
    @Published var L11: Int = 0 {
        didSet {
            if L11 < 0 {
                L11 = 0
            } else if L11 > 10 {
                L11 = 10
            }
        }
    }
    
    @Published var L12: Int = 0 {
        didSet {
            if L12 < 0 {
                L12 = 0
            } else if L12 > 12 {
                L12 = 12
            }
        }
    }
    
    @Published var L13: Int = 0 {
        didSet {
            if L13 < 0 {
                L13 = 0
            } else if L13 > 10 {
                L13 = 10
            }
        }
    }
    
    @Published var L14: Int = 0 {
        didSet {
            if L14 < 0 {
                L14 = 0
            } else if L14 > 10 {
                L14 = 10
            }
        }
    }
    
    @Published var L12Score: Int = 0
    
}
